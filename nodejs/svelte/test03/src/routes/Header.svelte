<script>
	import { page } from '$app/stores';
	// import logo from '$lib/images/svelte-logo.svg';
	// import github from '$lib/images/github.svg';
</script>
<!-- https://kit.svelte.dev/docs/link-options#data-sveltekit-reload  rel='external' -->
<header class="d-flex justify-content-center">  
	<ul class="nav nav-pills">
		<li class="nav-item">
			<a class= {$page.url.pathname === '/' ? 'nav-link active' : 'nav-link'}
			aria-current={$page.url.pathname === '/' ? 'page' : undefined} href="/" rel='external1'>실적</a>
		</li>
		<li class="nav-item">
			<a class= {$page.url.pathname === '/member' ? 'nav-link active' : 'nav-link'}
			aria-current={$page.url.pathname === '/member' ? 'page' : undefined} href="/member" rel='external1'>회원</a>
		</li>
		<li class="nav-item">
			<a class= {$page.url.pathname === '/class' ? 'nav-link active' : 'nav-link'}
			aria-current={$page.url.pathname === '/class' ? 'page' : undefined} href="/class" rel='external1'>일정</a>
		</li>
		<li class="nav-item">
			<a class= {$page.url.pathname === '/income' ? 'nav-link active' : 'nav-link'}
			aria-current={$page.url.pathname === '/income' ? 'page' : undefined} href="/income" rel='external1'>수입</a>
		</li>
</header>
