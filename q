[1mdiff --git a/src/App.vue b/src/App.vue[m
[1mindex dc8e1dd..8ad7fad 100644[m
[1m--- a/src/App.vue[m
[1m+++ b/src/App.vue[m
[36m@@ -1,9 +1,11 @@[m
 <template>[m
   <app-header></app-header>[m
[31m-  <router-view #="{ Component }">[m
[31m-    <keep-alive>[m
[31m-      <component :is="Component"></component>[m
[31m-    </keep-alive>[m
[32m+[m[32m  <router-view #="{ Component, route }">[m
[32m+[m[32m    <transition>[m
[32m+[m[32m      <keep-alive>[m
[32m+[m[32m        <component :is="Component" :key="route.path"></component>[m
[32m+[m[32m      </keep-alive>[m
[32m+[m[32m    </transition>[m
   </router-view>[m
 </template>[m
 [m
[36m@@ -15,4 +17,11 @@[m [mexport default {[m
   components: { TheCharsPage, AppHeader },[m
 };[m
 </script>[m
[31m-<style></style>[m
[32m+[m[32m<style lang='scss'>[m
[32m+[m[32m.v-enter-active {[m
[32m+[m[32m  transition: all 0.5s ease;[m
[32m+[m[32m}[m
[32m+[m[32m.v-enter-from {[m
[32m+[m[32m  opacity: 0;[m
[32m+[m[32m}[m
[32m+[m[32m</style>[m
[1mdiff --git a/src/components/TheCharsList.vue b/src/components/TheCharsList.vue[m
[1mindex de5bb04..b099fe3 100644[m
[1m--- a/src/components/TheCharsList.vue[m
[1m+++ b/src/components/TheCharsList.vue[m
[36m@@ -1,17 +1,24 @@[m
 <template>[m
   <div class="wrapper">[m
[31m-    <ul class="chars-list" v-if="charLists.length">[m
[32m+[m[32m    <TransitionGroup[m
[32m+[m[32m      tag="ul"[m
[32m+[m[32m      name="list"[m
[32m+[m[32m      appear[m
[32m+[m[32m      class="chars-list"[m
[32m+[m[32m      v-if="charLists.length"[m
[32m+[m[32m    >[m
       <li[m
         class="char"[m
         tabindex="0"[m
         v-for="char in charLists"[m
         :key="char.id"[m
         @click="setSelectedChar(char.id)"[m
[32m+[m[32m        @keypress.enter="setSelectedChar(char.id)"[m
       >[m
         <div class="img"><img :src="char.thumbnail" :alt="char.name" /></div>[m
         <h3 class="title fz-22">{{ char.name }}</h3>[m
       </li>[m
[31m-    </ul>[m
[32m+[m[32m    </TransitionGroup>[m
     <div class="loading-wrapper" v-else-if="loading">[m
       <app-spinner></app-spinner>[m
     </div>[m
[36m@@ -42,7 +49,7 @@[m [mexport default defineComponent({[m
   components: { AppButtonMain, AppSpinner },[m
   setup() {[m
     const store = useCharsList();[m
[31m-    const { getChars,setSelectedChar } = store;[m
[32m+[m[32m    const { getChars, setSelectedChar } = store;[m
     const { charLists, status, ended } = storeToRefs(store);[m
     const { loading, error } = useStatus(status);[m
     const buttonText = computed(() => {[m
[36m@@ -86,6 +93,10 @@[m [mexport default defineComponent({[m
   height: 200px;[m
 }[m
 [m
[32m+[m[32m.list-enter-from {[m
[32m+[m[32m  opacity: 0;[m
[32m+[m[32m}[m
[32m+[m
 .char {[m
   display: block;[m
   background-color: $secondary;[m
[1mdiff --git a/src/components/TheRandomChar.vue b/src/components/TheRandomChar.vue[m
[1mindex 1887d0f..2c904d4 100644[m
[1m--- a/src/components/TheRandomChar.vue[m
[1m+++ b/src/components/TheRandomChar.vue[m
[36m@@ -6,30 +6,32 @@[m
     <template v-else-if="error">[m
       <p>{{ STATUS_ERROR }}</p>[m
     </template>[m
[31m-    <template v-else-if="randomChar">[m
[31m-      <div class="preview">[m
[31m-        <img :src="randomChar.thumbnail" :alt="randomChar.name" />[m
[31m-      </div>[m
[31m-      <div class="text">[m
[31m-        <h2 class="title fz-22">{{ randomChar.name }}</h2>[m
[31m-        <p class="description fz-14">[m
[31m-          {{ randomChar.description }}[m
[31m-        </p>[m
[31m-        <div class="btn-group">[m
[31m-          <template v-for="link in randomChar.links" :key="link.label">[m
[31m-            <app-button-main type="a" :href="link.url" :className="link.type"[m
[31m-              >{{ link.label }}[m
[31m-            </app-button-main>[m
[31m-          </template>[m
[32m+[m[32m    <Transition v-else-if="randomChar" appear>[m
[32m+[m[32m      <div class="wrapper">[m
[32m+[m[32m        <div class="preview">[m
[32m+[m[32m          <img :src="randomChar.thumbnail" :alt="randomChar.name" />[m
[32m+[m[32m        </div>[m
[32m+[m[32m        <div class="text">[m
[32m+[m[32m          <h2 class="title fz-22">{{ randomChar.name }}</h2>[m
[32m+[m[32m          <p class="description fz-14">[m
[32m+[m[32m            {{ randomChar.description }}[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <div class="btn-group">[m
[32m+[m[32m            <template v-for="link in randomChar.links" :key="link.label">[m
[32m+[m[32m              <app-button-main type="a" :href="link.url" :className="link.type"[m
[32m+[m[32m                >{{ link.label }}[m
[32m+[m[32m              </app-button-main>[m
[32m+[m[32m            </template>[m
[32m+[m[32m          </div>[m
         </div>[m
       </div>[m
[31m-    </template>[m
[32m+[m[32m    </Transition>[m
   </article>[m
 </template>[m
 [m
 <script lang="ts">[m
 import AppButtonMain from '@/components/AppButtonMain.vue';[m
[31m-import { computed, defineComponent, onMounted } from 'vue';[m
[32m+[m[32mimport { defineComponent, onMounted } from 'vue';[m
 import useRandomChar from '@/stores/useRandomChar';[m
 import { storeToRefs } from 'pinia';[m
 import useStatus from '@/hooks/useStatus';[m
[36m@@ -55,6 +57,9 @@[m [mexport default defineComponent({[m
   padding: 35px;[m
   background: #ffffff;[m
   box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.25);[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.wrapper {[m
   display: flex;[m
   gap: 30px;[m
 }[m
[1mdiff --git a/src/components/TheSelectedChar.vue b/src/components/TheSelectedChar.vue[m
[1mindex d9742d1..20b8602 100644[m
[1m--- a/src/components/TheSelectedChar.vue[m
[1m+++ b/src/components/TheSelectedChar.vue[m
[36m@@ -1,5 +1,5 @@[m
 <template>[m
[31m-  <div class="selected-char">[m
[32m+[m[32m  <div class="selected-char" ref="parentChar">[m
     <div class="preview">[m
       <div class="img"><img :src="char.thumbnail" :alt="char.name" /></div>[m
       <div class="control">[m
[36m@@ -27,7 +27,7 @@[m
 [m
 <script lang="ts">[m
 import type { Prop } from 'vue';[m
[31m-import { defineComponent } from 'vue';[m
[32m+[m[32mimport { defineComponent, onUpdated, ref } from 'vue';[m
 import AppButtonMain from '@/components/AppButtonMain.vue';[m
 import type { iTransformChar } from '@/types/interfaces';[m
 [m
[1mdiff --git a/src/components/TheSelectedLayout.vue b/src/components/TheSelectedLayout.vue[m
[1mindex c0679d0..fb4b4bb 100644[m
[1m--- a/src/components/TheSelectedLayout.vue[m
[1m+++ b/src/components/TheSelectedLayout.vue[m
[36m@@ -1,7 +1,12 @@[m
 <template>[m
   <aside ref="selectLayout">[m
     <app-skeleton v-if="!selectedChar"></app-skeleton>[m
[31m-    <the-selected-char v-else :char="selectedChar"></the-selected-char>[m
[32m+[m[32m    <transition v-else appear>[m
[32m+[m[32m      <the-selected-char[m
[32m+[m[32m        :char="selectedChar"[m
[32m+[m[32m        :key="selectedChar.id"[m
[32m+[m[32m      ></the-selected-char>[m
[32m+[m[32m    </transition>[m
   </aside>[m
 </template>[m
 [m
[1mdiff --git a/src/pages/TheCharsPage.vue b/src/pages/TheCharsPage.vue[m
[1mindex fd0b025..2163bc6 100644[m
[1m--- a/src/pages/TheCharsPage.vue[m
[1m+++ b/src/pages/TheCharsPage.vue[m
[36m@@ -1,12 +1,18 @@[m
 <template>[m
[31m-  <div class="container random-wrapper">[m
[31m-    <the-random-char></the-random-char>[m
[31m-    <the-random-banner></the-random-banner>[m
[31m-  </div>[m
[31m-  <div class="container list-wrapper">[m
[31m-    <the-chars-list></the-chars-list>[m
[31m-    <the-char-selected></the-char-selected>[m
[31m-  </div>[m
[32m+[m[32m  <main>[m
[32m+[m[32m    <section class="random">[m
[32m+[m[32m      <div class="container random-wrapper">[m
[32m+[m[32m        <the-random-char></the-random-char>[m
[32m+[m[32m        <the-random-banner></the-random-banner>[m
[32m+[m[32m      </div>[m
[32m+[m[32m    </section>[m
[32m+[m[32m    <section class="char-list">[m
[32m+[m[32m      <div class="container list-wrapper">[m
[32m+[m[32m        <the-chars-list></the-chars-list>[m
[32m+[m[32m        <the-char-selected></the-char-selected>[m
[32m+[m[32m      </div>[m
[32m+[m[32m    </section>[m
[32m+[m[32m  </main>[m
 </template>[m
 [m
 <script>[m
