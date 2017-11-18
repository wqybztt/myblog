<template>
    <div>
        <router-view></router-view>
    </div>
</template>
<script>
import types from '@/store/types';
export default{
    name: 'material-page',
    data () {
        return {
        }
    },
    beforeCreate(){
        if(!this.$store.state.cates.length) this.$store.dispatch(types.CATES);
    }
}
</script>
<style scoped>
</style>