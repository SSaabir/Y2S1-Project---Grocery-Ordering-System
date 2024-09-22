// log in java script 
document.addEventListener('DOMContentLoaded', () => {
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add('right-panel-active');
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove('right-panel-active');
    });

    document.getElementById('signUpForm').addEventListener('submit', handleFormSubmit);
    document.getElementById('signInForm').addEventListener('submit', handleFormSubmit);
});

function handleFormSubmit(event) {
    event.preventDefault();
    const form = event.target;
    const formType = form.id === 'signUpForm' ? 'signUp' : 'signIn';

    let isValid = true;
    const fields = getFormFields(formType);

    fields.forEach(({
        id,
        minLength,
        errorId,
        validate
    }) => {
        const value = document.getElementById(id).value.trim();
        const errorElement = document.getElementById(errorId);

        if (validate(value)) {
            errorElement.innerText = '';
        } else {
            errorElement.innerText = `${id.replace(/([A-Z])/g, ' $1').toLowerCase()} must be at least ${minLength} characters`;
            isValid = false;
        }
    });

    if (isValid) {
        document.getElementById(`${formType}Success`).style.display = 'block';
        console.log(getFormData(formType));

    }
}

function getFormFields(type) {
    if (type === 'signUp') {
        return [{
            id: 'signUpName',
            minLength: 3,
            errorId: 'nameError',
            validate: value => value.length >= 3
        }, {
            id: 'signUpEmail',
            minLength: 5,
            errorId: 'emailError',
            validate: validateEmail
        }, {
            id: 'signUpPassword',
            minLength: 6,
            errorId: 'passwordError',
            validate: value => value.length >= 6
        }, {
            id: 'signUpPhone',
            minLength: 10,
            errorId: 'phoneError',
            validate: value => value.length >= 10
        }, {
            id: 'signUpAddress',
            minLength: 5,
            errorId: 'addressError',
            validate: value => value.length >= 5
        }];
    } else {
        return [{
            id: 'signInEmail',
            minLength: 5,
            errorId: 'signInEmailError',
            validate: validateEmail
        }, {
            id: 'signInPassword',
            minLength: 6,
            errorId: 'signInPasswordError',
            validate: value => value.length >= 6
        }];
    }
}

function getFormData(type) {
    if (type === 'signUp') {
        return {
            name: document.getElementById('signUpName').value.trim(),
            email: document.getElementById('signUpEmail').value.trim(),
            password: document.getElementById('signUpPassword').value.trim(),
            phone: document.getElementById('signUpPhone').value.trim(),
            address: document.getElementById('signUpAddress').value.trim()
        };
    } else {
        return {
            email: document.getElementById('signInEmail').value.trim(),
            password: document.getElementById('signInPassword').value.trim()
        };
    }
}

function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(String(email).toLowerCase());
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// Registation javascript 
function calculateAge(dateOfBirth) {
    const today = new Date();
    const dob = new Date(dateOfBirth);
    let age = today.getFullYear() - dob.getFullYear();
    const monthDifference = today.getMonth() - dob.getMonth();
    if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < dob.getDate())) {
        age--;
    }
    return age;
}

document.getElementById('registrationForm').addEventListener('submit', function(event) {
    const dob = document.getElementById('dob').value;
    const age = calculateAge(dob);

    if (age < 20) {
        alert('Age should be greater than 20.');
        event.preventDefault(); // Prevent form submission
        return;
    }

    alert('Form submitted successfully!');
    this.submit(); // Submit the form if the condition is met
});

document.getElementById('driverOption').addEventListener('change', function() {
    if (this.checked) {
        window.location.href = "Delivery_person.html";
    }
});



/////////////////////////////////////////////////////////////////////////////////////////////////////