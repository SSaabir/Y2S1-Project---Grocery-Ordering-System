document.addEventListener('DOMContentLoaded', function() {

    document.getElementById('registrationForm').addEventListener('submit', function(event) {
        const dob = document.getElementById('dob').value;
        const age = calculateAge(new Date(dob));

        if (age < 20) {
            alert('You must be at least 20 years old to register.');
            event.preventDefault();
        } else {
            alert('Form submitted successfully!');

        }
    });


    function calculateAge(birthDate) {
        const today = new Date();
        let age = today.getFullYear() - birthDate.getFullYear();
        const monthDifference = today.getMonth() - birthDate.getMonth();

        if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }

        return age;
    }
});