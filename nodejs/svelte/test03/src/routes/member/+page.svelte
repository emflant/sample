<script>
    const menus = ['A first link item', 'A second link item', 
        'A third link item', 'A fourth link item'];
    let active_item = 0;
    export let data;
    console.log(data);
</script>

<div><h2>회원관리</h2></div>

<div class="list-group">
    {#each data.summaries as menu, i}
        <a href="#" class="list-group-item list-group-item-action { active_item === i ? 'active' : '' }" 
            on:click={ () => active_item = i }>{menu.title}
        </a>
    {/each}
</div>