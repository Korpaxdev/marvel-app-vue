<template>
  <button
    v-if="type === 'button'"
    class="button-main fz-14"
    :class="className"
    @click="$emit('click')"
    :disabled="disabled"
    :style="style"
  >
    <slot>Default</slot>
  </button>
  <a
    v-if="type === 'a'"
    :href="href ? href : '#'"
    class="button-main fz-14"
    :class="className"
    @click="$emit('click')"
    target="_blank"
  >
    <slot>Default</slot>
  </a>
</template>

<script lang="ts" setup>
import { defineProps } from 'vue';
import type { btnClass } from '@/types/types';

defineEmits(['click']);
defineProps<{
  type: 'button' | 'a';
  href?: string;
  className: btnClass;
  disabled?: boolean;
  style?: object;
}>();
</script>

<style lang="scss" scoped>
@import 'src/sass/variables';

.button-main {
  display: inline-block;
  padding: 10px 18px;
  min-width: 100px;
  color: #fff;
  border: none;
  text-transform: uppercase;
  cursor: pointer;
  transition: transform 0.4s ease;
  text-align: center;

  &:hover {
    transform: translateY(-5px);
  }
}

.button-main:disabled {
  filter: grayscale(0.5);
  cursor: not-allowed;

  &:hover {
    transform: none;
  }
}

.primary {
  background-color: $primary;
}

.secondary {
  background-color: $secondary-btn;
}
</style>
