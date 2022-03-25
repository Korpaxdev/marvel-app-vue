<template>
  <div class="selected-char" ref="parentChar">
    <div class="preview">
      <div class="img"><img :src="char.thumbnail" :alt="char.name" /></div>
      <div class="control">
        <h3 class="title fz-22">{{ char.name }}</h3>
        <div class="btn-group">
          <template v-for="link in char.links" :key="link.label">
            <app-button-main :class-name="link.type" type="a" :href="link.url"
              >{{ link.label }}
            </app-button-main>
          </template>
        </div>
      </div>
    </div>
    <p class="description fz-14">
      {{ char.description }}
    </p>
    <h4 class="comics-title">Comics:</h4>
    <ul class="comics-list">
      <li v-for="(comicName, i) in char.comics" class="comic-item" :key="i">
        {{ comicName }}
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
import type { Prop } from 'vue';
import { defineComponent, onUpdated, ref } from 'vue';
import AppButtonMain from '@/components/AppButtonMain.vue';
import type { iTransformChar } from '@/types/interfaces';

export default defineComponent({
  components: { AppButtonMain },
  props: {
    char: {} as Prop<iTransformChar>,
  },
});
</script>

<style lang="scss" scoped>
.selected-char {
  padding: 25px;
  background: #ffffff;
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.25);
}

.preview {
  display: flex;
  gap: 25px;
}

.img {
  flex: 0 0 150px;
  width: 150px;
  height: 150px;

  img {
    object-fit: fill;
    width: 100%;
    height: 100%;
  }
}

.control {
  display: flex;
  flex-direction: column;
}

.title {
  font-weight: 700;
  flex: 1 1 auto;
}

.btn-group {
  width: max-content;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.description {
  margin-top: 15px;
}

.comics-title {
  font-size: 18px;
  font-weight: 700;
  margin-top: 10px;
}

.comics-list {
  list-style-type: none;
  padding: 0;
  margin: 10px 0 0 0;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.comic-item {
  padding: 4px 10px;
  background: #ffffff;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}
</style>
