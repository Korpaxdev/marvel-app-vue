import { defineStore } from 'pinia';
import type { iTransformChar } from '@/types/interfaces';
import { API, CHARS_LIMIT, KEY, OFFSET, STATUS } from '@/utils/const';
import { useCharRequest } from '@/hooks/useCharRequest';

const useCharsList = defineStore('charList', {
  state: () => ({
    charLists: [] as iTransformChar[],
    status: '' as string,
    offset: OFFSET as number,
    ended: false,
    selectedChar: null as null | iTransformChar,
  }),
  actions: {
    async getChars() {
      if (!this.ended) {
        try {
          const { characters } = await useCharRequest(
            `${API}characters?limit=${CHARS_LIMIT}&offset=${this.offset}&${KEY}`,
            this.changeStatus,
          );
          this.charLists.push(...characters);
          this.offset += CHARS_LIMIT;
          if (characters.length < CHARS_LIMIT) this.ended = true;
        } catch (e) {
          this.changeStatus(STATUS.ERROR);
        }
      }
    },
    setSelectedChar(id: number) {
      const selected = this.charLists.filter((char) => char.id === id);
      if (selected.length) {
        this.selectedChar = selected[0];
      }
    },
    changeStatus(status: string) {
      this.status = status;
    },
  },
});
export default useCharsList;
