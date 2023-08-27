<script>
	import Nested1 from './Nested.svelte'
	let name = 'Svelte';
	let string = `this string contains some <strong>HTML!!!</strong>`;
	let count = 0;
	$: doubled = count * 3;
	$: if(count < 10){
		console.log(`the count is ${count}`)
	}

	function increment(){
		count += 1;
	}


	let numbers = [1,2,3,4];
	function add_number(){
		numbers.push(numbers.length + 1);
		numbers = numbers;
	}
</script>

<main>
	<h1>Hello {name.toUpperCase()}!!</h1>
	<p>{@html string}</p>
	<button class="btn btn-primary" on:click={increment}>Clicked {count} 
	{count === 1 ? 'time' : 'times'}</button>
	<p>3 x {count} = {doubled}</p>

	<button class="btn btn-primary" on:click={add_number}>Add number</button>
	<p>{numbers.join('+')}</p>

	<Nested1 answer={421} />
	<Nested1></Nested1>

	{#if count > 10}
	<p>{count} is greater then 10</p>
	{/if}
</main>

<style>
</style>