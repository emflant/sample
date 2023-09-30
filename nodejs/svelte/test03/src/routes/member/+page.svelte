<script>
    // const menus = ['A first link item', 'A second link item', 
    //     'A third link item', 'A fourth link item'];
    let active_item = 0;
    let contents = {};

    export let data;
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
    <div class="col-9">
        <div class="row">
            <div class="col-6">
                <label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="20">{JSON.stringify(contents, null, 2)}</textarea>
            </div>
            <div class="col-6">
                <div class="mb-2">
                    <label for="name" class="form-label">이름</label>
                    <input class="form-control" id="name" type="text" placeholder="Default input" aria-label="default input example" bind:value={contents.name}>
                </div>
                <div class="mb-2">
                    <label for="gender" class="form-label">성별</label>
                    <input class="form-control" id="gender" type="text" placeholder="Default input" aria-label="default input example" bind:value={contents.gender}>
                </div>
                <div class="mb-2">
                    <label for="birth" class="form-label">생일</label>
                    <input class="form-control" id="birth" type="text" placeholder="Default input" aria-label="default input example" bind:value={contents.birth}>
                </div>
            </div>
        </div>
    </div>
</div>
