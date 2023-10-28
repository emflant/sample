<script>

    import InputText from '../@/InputText.svelte'
    import Select from '../@/Select.svelte'
    // import Validation from '../@/Validation.svelte'
    import validation from '$lib/js/form-validation.js'
    // import test1 from '$lib/js/test1.js'

    console.log('1');
    export let data;

    let active_item = 0;
    let contents = {};
    let cdGender = [ { id : null, name : '-'}, { id : 'M', name : '남' }, { id : 'F', name : '여'}];

    // console.log(data);
    function aa(name, i){
        active_item = i;
        roll(name);
    }

    async function roll(i) {
		const response = await fetch('/member/select?name=' + i);
		const result = await response.json();
        // console.log(result);
        contents = result;
	}

    function bb(){
        const forms = document.querySelectorAll('.needs-validation');
        
        Array.from(forms).forEach(form => {
            if (!form.checkValidity()) {
                console.log('input need!!');
                // form.classList.add('was-validated');
            } else {
                // form.classList.remove('was-validated');
            }
            // console.log(form.classList);

            // bootstrap 에서 was-validated 추가를 하면 form 내의 css 로직과 연결되어 필수체크 스타일이 발생한다.
            // add 된다고해서 무조건 추가되는 건 아니고, Set 데이터구조와 동일하게 있는건 추가가 되지 않음.
            form.classList.add('was-validated')
        })
    }

    // validation();
    // test1('테스트');

</script>

<div><h2>회원관리</h2></div>
<div class="row">
    <div class="col-3">
        <div class="list-group">
            {#each data.summaries as member, i}
                <a href="#" class="list-group-item list-group-item-action { active_item === i ? 'active' : '' }" on:click={ () => aa(member.name, i) }>{member.name}
                </a>
            {/each}
        </div>
        <button on:click={bb}>bb()</button>
    </div>
    <div class="col">
        <div class="row">
            <div class="col-6">
                <label for="exampleFormControlTextarea1" class="form-label">결과</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="5">{JSON.stringify(contents, null, 2)}</textarea>
            </div>
            <div class="col-6">
                <form method="POST" class="needs-validation" novalidate>
                    <div class="mb-2">
                        <InputText id = "name" title="이름" bind:val={contents.name} />
                    </div>
                    <div class="mb-2">
                        <Select id="gender" bind:val={contents.gender} cdSet={cdGender} />
                    </div>
                    <button class="btn btn-primary" type="submit">submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- <Validation /> -->
