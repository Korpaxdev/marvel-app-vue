import type { RouteRecordRaw } from 'vue-router';
import { createRouter, createWebHistory } from 'vue-router';
import TheCharsPage from '@/pages/TheCharsPage.vue';
import TheComicsPage from '@/pages/TheComicsPage.vue';

const routes: RouteRecordRaw[] = [
  {
    path: '/',
    component: TheCharsPage,
  },
  {
    path: '/comics',
    component: TheComicsPage,
  },
];
const router = createRouter({
  history: createWebHistory(),
  routes,
  linkActiveClass: 'active',
  linkExactActiveClass: 'active',
});
export default router;
