import { createApp } from 'vue';
import { createPinia } from 'pinia';
import App from './App.vue';
import './sass/style.scss';
import router from '@/routes';

const app = createApp(App);
app.use(createPinia());
app.use(router);
app.mount('#app');
