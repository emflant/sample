<script>
    export let title = "제목";
    export let id;
    export let val;
</script>

<label for="{id}" class="form-label">{title}</label>
<input type="text" class="form-control" id="{id}" name="{id}" 
    bind:value={val} placeholder="" aria-label="" required>
<div class="valid-feedback">
    Looks good!
</div>
<div class="invalid-feedback">
    입력하세요.
</div>
  