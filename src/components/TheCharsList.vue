<template>
  <div class="wrapper">
    <ul class="chars-list" v-if="charLists.length">
      <li
        class="char"
        tabindex="0"
        v-for="char in charLists"
        :key="char.id"
        @click="setSelectedChar(char.id)"
      >
        <div class="img"><img :src="char.thumbnail" :alt="char.name" /></div>
        <h3 class="title fz-22">{{ char.name }}</h3>
      </li>
    </ul>
    <div class="loading-wrapper" v-else-if="loading">
      <app-spinner></app-spinner>
    </div>
    <template v-if="error">
      <p>{{ MESSAGES.STATUS_ERROR }}</p>
    </template>
    <app-button-main
      class-name="primary"
      type="button"
      @click="getChars"
      :disabled="loading || ended"
      :style="{ display: 'block', margin: '0 auto' }"
      >{{ buttonText }}
    </app-button-main>
  </div>
</template>
<script lang="ts">
import { computed, defineComponent, onMounted } from 'vue';
import useCharsList from '@/stores/useCharsList';
import { storeToRefs } from 'pinia';
import useStatus from '@/hooks/useStatus';
import AppSpinner from '@/components/AppSpinner.vue';
import AppButtonMain from '@/components/AppButtonMain.vue';
import { MESSAGES } from '@/utils/const';
import { BUTTON_LABEL } from '@/utils/const';

export default defineComponent({
  components: { AppButtonMain, AppSpinner },
  setup() {
    const store = useCharsList();
    const { getChars,setSelectedChar } = store;
    const { charLists, status, ended } = storeToRefs(store);
    const { loading, error } = useStatus(status);
    const buttonText = computed(() => {
      if (ended.value) return BUTTON_LABEL.END;
      return loading.value ? BUTTON_LABEL.LOADING : BUTTON_LABEL.LOAD;
    });
    onMounted(() => getChars());

    return {
      charLists,
      loading,
      error,
      getChars,
      buttonText,
      setSelectedChar,
      MESSAGES,
      ended,
    };
  },
});
</script>
<style lang="scss" scoped>
@import 'src/sass/variables';

.wrapper {
  position: relative;
}

.chars-list {
  padding: 0 0 50px 0;
  margin: 0;
  list-style-type: none;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: 318px;
  gap: 25px;
}

.loading-wrapper {
  position: relative;
  height: 200px;
}

.char {
  display: block;
  background-color: $secondary;
  cursor: pointer;
  transition: all 0.4s ease;
  user-select: none;
  filter: drop-shadow(5px 5px 10px rgba(0, 0, 0, 0.25));

  &:hover {
    transform: translateY(-5px);
  }

  &:focus {
    filter: drop-shadow(0px 5px 20px $primary);
  }
}

.img {
  width: 200px;
  height: 200px;

  img {
    width: 100%;
    height: 100%;
    object-fit: fill;
  }
}

.title {
  font-weight: 700;
  color: #fff;
  padding: 15px;
}
</style>
