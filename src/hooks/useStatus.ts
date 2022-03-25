import { computed } from 'vue';
import type { Ref } from 'vue';

export default function (status: Ref<string>) {
  const loading = computed(() => status.value === 'loading');
  const error = computed(() => status.value === 'error');
  return {
    loading,
    error,
  };
}
