new Vue({
    el: '#app',
    data: {
      formData: {
        comment: '',
        name: '',
        address: '',
        email: '',
        phone: ''
      }
    },
    methods: {
      submitForm() {
        // Validate email
        if (!this.isValidEmail(this.formData.email)) {
          alert('Invalid email address');
          return;
        }
  
        // Validate phone number
        if (!this.isValidPhoneNumber(this.formData.phone)) {
          alert('Invalid phone number. Please use format: 123-456-7890');
          return;
        }
  
        // Submit the form (you can make an AJAX request here)
        console.log('Form submitted:', this.formData);
      },
      isValidEmail(email) {
        var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return regex.test(email);
      },
      isValidPhoneNumber(phone) {
        var regex = /^\d{3}-\d{3}-\d{4}$/;
        return regex.test(phone);
      }
    }
  });
  