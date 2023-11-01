export default function(){
    const forms = document.querySelectorAll('.needs-validation');
    
    Array.from(forms).forEach(form => {

        let result = true;

        console.log(form);

        if (!form.checkValidity()) {
            console.log('input need!!');
            result = false;
        }


        // bootstrap 에서 was-validated 추가를 하면 form 내의 css 로직과 연결되어 필수체크 스타일이 발생한다.
        // add 된다고해서 무조건 추가되는 건 아니고, Set 데이터구조와 동일하게 있는건 추가가 되지 않음.
        form.classList.add('was-validated')

        return result;
    })
}