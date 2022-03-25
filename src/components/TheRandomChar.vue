<template>
  <article class="random">
    <template v-if="loading">
      <app-spinner></app-spinner>
    </template>
    <template v-else-if="error">
      <p>{{ STATUS_ERROR }}</p>
    </template>
    <template v-else-if="randomChar">
      <div class="preview">
        <img :src="randomChar.thumbnail" :alt="randomChar.name" />
      </div>
      <div class="text">
        <h2 class="title fz-22">{{ randomChar.name }}</h2>
        <p class="description fz-14">
          {{ randomChar.description }}
        </p>
        <div class="btn-group">
          <template v-for="link in randomChar.links" :key="link.label">
            <app-button-main type="a" :href="link.url" :className="link.type"
              >{{ link.label }}
            </app-button-main>
          </template>
        </div>
      </div>
    </template>
  </article>
</template>

<script lang="ts">
import AppButtonMain from '@/components/AppButtonMain.vue';
import { computed, defineComponent, onMounted } from 'vue';
import useRandomChar from '@/stores/useRandomChar';
import { storeToRefs } from 'pinia';
import useStatus from '@/hooks/useStatus';
import { MESSAGES } from '@/utils/const';
import AppSpinner from '@/components/AppSpinner.vue';

export default defineComponent({
  components: { AppSpinner, AppButtonMain },
  setup() {
    const store = useRandomChar();
    const { getRandomChar } = store;
    onMounted(() => getRandomChar());
    const { randomChar, status } = storeToRefs(store);
    const { loading, error } = useStatus(status);
    const { STATUS_ERROR } = MESSAGES;
    return { randomChar, loading, error, STATUS_ERROR };
  },
});
</script>
<style scoped lang="scss">
.random {
  position: relative;
  padding: 35px;
  background: #ffffff;
  box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.25);
  display: flex;
  gap: 30px;
}

.preview {
  flex: 0 0 180px;
  height: 180px;

  img {
    width: 100%;
    height: 100%;
    object-fit: fill;
  }
}

.text {
  display: flex;
  flex-direction: column;
}

.title {
  text-transform: uppercase;
  font-weight: 700;
}

.description {
  padding: 0;
  margin: 15px 0;
  flex: 1 1 auto;
}

.btn-group {
  display: flex;
  gap: 30px;
}
</style>
