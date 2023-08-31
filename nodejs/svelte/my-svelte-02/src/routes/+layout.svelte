<script>
	import Header from './Header.svelte';
	import './styles.css';
</script>

<div class="app">
	<Header />

	<main>
		<slot />
	</main>

	<footer>
		<button type="button" class="btn btn-primary" onclick="location.href='/'">Home</button>
	</footer>
</div>
