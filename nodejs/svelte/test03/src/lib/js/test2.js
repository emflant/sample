
export default function(event){

    // console.log('test2.js');
    const form = event.target;

    if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
    }

    form.classList.add('was-validated');
}