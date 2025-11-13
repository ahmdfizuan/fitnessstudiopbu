// app.js - form validation + success modal
document.addEventListener('DOMContentLoaded', function() {
  // Bootstrap modal element (if any page has it)
  var successModalEl = document.getElementById('successModal');
  var successModal = successModalEl ? new bootstrap.Modal(successModalEl) : null;

  // Registration form validation
  var regForm = document.getElementById('registrationForm');
  if (regForm) {
    regForm.addEventListener('submit', function(e) {
      e.preventDefault();
      e.stopPropagation();

      // Simple JS validation rules
      var valid = true;
      var name = regForm.querySelector('#fullname');
      var email = regForm.querySelector('#email');
      var phone = regForm.querySelector('#phone');
      var program = regForm.querySelector('#program');
      var terms = regForm.querySelector('#terms');

      // Reset prior states
      [name, email, phone, program, terms].forEach(function(el){
        if(!el) return;
        el.classList.remove('is-invalid');
      });

      if(!name.value.trim() || name.value.trim().length < 3) { valid = false; name.classList.add('is-invalid'); }
      if(!/^\S+@\S+\.\S+$/.test(email.value.trim())) { valid = false; email.classList.add('is-invalid'); }
      if(!/^[0-9+\-\s]{7,15}$/.test(phone.value.trim())) { valid = false; phone.classList.add('is-invalid'); }
      if(program.value === '') { valid = false; program.classList.add('is-invalid'); }
      if(!terms.checked) { valid = false; terms.classList.add('is-invalid'); }

      if(valid) {
        // Simulate successful submission; in real app you'd send to server via fetch()
        regForm.reset();
        if(successModal) successModal.show();

        // optionally set focus to close button
        var closeBtn = document.querySelector('#successModal button[data-bs-dismiss="modal"]');
        if(closeBtn) closeBtn.focus();
      } else {
        // focus first invalid
        var firstInvalid = regForm.querySelector('.is-invalid');
        if(firstInvalid) firstInvalid.focus();
      }
    }, false);
  }
});
