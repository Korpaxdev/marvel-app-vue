<template>
  <div class="random-banner">
    <h3 class="title fz-24">
      Random character for today! <br />
      Do you want to get to know him better?
    </h3>
    <h3 class="title fz-24">Or choose another one</h3>
    <app-button-main
      type="button"
      class-name="primary"
      @click="getRandomChar"
      :disabled="isLoading"
      >{{ buttonText }}
    </app-button-main>
    <div class="img"><img src="src/assets/mielnir.png" alt="mielnir" /></div>
  </div>
</template>

<script lang="ts">
import AppButtonMain from '@/components/AppButtonMain.vue';
import useRandomChar from '@/stores/useRandomChar';
import { computed } from 'vue';
import { BUTTON_LABEL, STATUS } from '@/utils/const';

export default {
  components: { AppButtonMain },
  setup() {
    const store = useRandomChar();
    const { getRandomChar } = store;
    const isLoading = computed(() => store.status === STATUS.LOADING);
    const buttonText = computed(() =>
      isLoading.value ? BUTTON_LABEL.LOADING : BUTTON_LABEL.TRY,
    );
    return {
      getRandomChar,
      isLoading,
      buttonText,
    };
  },
};
</script>
<style scoped lang="scss">
@import 'src/sass/_variables.scss';

.random-banner {
  padding: 35px;
  background-color: $secondary;
  position: relative;
}

.title {
  color: #fff;
  font-weight: 700;

  &:not(:last-of-type) {
    margin-bottom: 40px;
  }

  &:last-of-type {
    margin-bottom: 20px;
  }
}

.img {
  position: absolute;
  bottom: 10px;
  right: 15px;
  width: 140px;
  max-height: 200px;
  overflow: hidden;

  img {
    width: 100%;
  }
}
</style>
