import { defineStore } from 'pinia';
import type { iTransformChar } from '@/types/interfaces';
import { API, KEY, STATUS } from '@/utils/const';
import { useCharRequest } from '@/hooks/useCharRequest';

const useRandomChar = defineStore('randomChar', {
  state: () => ({
    randomChar: null as null | iTransformChar,
    status: '' as string,
  }),
  actions: {
    async getRandomChar() {
      const offset = Math.round(Math.random() * 1560);
      try {
        const { characters } = await useCharRequest(
          `${API}characters?limit=1&offset=${offset}&${KEY}`,
          this.changeStatus,
        );
        this.randomChar = characters[0];
      } catch (e) {
        this.changeStatus(STATUS.ERROR);
      }
    },
    changeStatus(status: string) {
      this.status = status;
    },
  },
});
export default useRandomChar;
