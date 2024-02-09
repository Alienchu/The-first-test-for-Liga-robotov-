document.getElementById('contactForm').addEventListener('submit', function(event) {
    event.preventDefault();
    var form = event.target;
    var formData = new FormData(form);
  
    // Validate email
    var email = formData.get('email');
    if (!isValidEmail(email)) {
      alert('Invalid email address');
      return;
    }
  
    // Validate phone number
    var phone = formData.get('phone');
    if (!isValidPhoneNumber(phone)) {
      alert('Invalid phone number. Please use format: 123-456-7890');
      return;
    }
  
    // Submit the form if validation passes
    form.submit();
  });
  
  function isValidEmail(email) {
    var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
  }
  
  function isValidPhoneNumber(phone) {
    var regex = /^\d{3}-\d{3}-\d{4}$/;
    return regex.test(phone);
  }
  