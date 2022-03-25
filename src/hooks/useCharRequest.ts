import type { iRequest, iTransformChar } from '@/types/interfaces';
import { STATUS } from '@/utils/const';
import transformChars from '@/utils/transformChars';

export async function useCharRequest(
  url: string,
  changeStatus: (status: string) => void,
): Promise<{ characters: iTransformChar[] }> {
  changeStatus(STATUS.LOADING);
  const request = await fetch(url);
  const data: iRequest = await request.json();
  const { results } = data.data;
  const characters = results.map((item) => transformChars(item));
  changeStatus(STATUS.DONE);
  return {
    characters,
  };
}
