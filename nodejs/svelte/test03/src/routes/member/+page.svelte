<script>

    import InputText from '../@/InputText.svelte'
    import Select from '../@/Select.svelte'
    import { validateForm, resetAllForm } from '$lib/js/formValidation.js'

    export let data;

    let active_item = 0;
    let contents = {};
    let cdGender = [ { id : null, name : '-'}, { id : 'M', name : '남' }, { id : 'F', name : '여'}];

    function aa(name, i){
        active_item = i;
        roll(name);
    }

    async function roll(i) {
		const response = await fetch('/member/select?name=' + i);
		const result = await response.json();
        // console.log(result);
        contents = result;

        resetAllForm();
	}

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
    </div>
    <div class="col">
        <div class="row">
            <div class="col-md">
                <label for="exampleFormControlTextarea1" class="form-label">결과</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="5">{JSON.stringify(contents, null, 2)}</textarea>
            </div>
            <div class="col">
                <form method="POST" class="needs-validation" novalidate on:submit={validateForm}>
                    <div class="mb-2">
                        <InputText id = "name" title="이름" bind:val={contents.name} />
                    </div>
                    <div class="mb-2">
                        <Select id="gender" bind:val={contents.gender} cdSet={cdGender} validateYn={true}/>
                    </div>
                    <button class="btn btn-primary" type="submit">submit</button>
                </form>
            </div>

        </div>
    </div>
</div>
