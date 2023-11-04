export function validateForm(event){

    const form = event.target;

    if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
    }

    form.classList.add('was-validated');
}

export function resetAllForm(){
    const forms = document.querySelectorAll('.needs-validation');
    
    Array.from(forms).forEach(form => {
        form.classList.remove('was-validated');
    })
}