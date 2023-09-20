<script>
    // const menus = ['A first link item', 'A second link item', 
    //     'A third link item', 'A fourth link item'];
    let active_item = 0;
    let contents = '';
    export let data;
    // console.log(data);
    function aa(i){
        active_item = i;
        // contents = text;
        roll(i);
    }

    async function roll(i) {
		const response = await fetch('/member/select');
		const result = await response.json();
        // console.log(result);
        contents = result.values[i];
	}
</script>

<div><h2>회원관리</h2></div>

<div class="list-group">
    {#each data.summaries as menu, i}
        <a href="#" class="list-group-item list-group-item-action { active_item === i ? 'active' : '' }" 
            on:click={ () => aa(i) }>{menu.title}
        </a>
    {/each}
</div>
<div>
    {@html contents}
</div>