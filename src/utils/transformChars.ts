import { MAX_LENGTH_DESCR, MESSAGES } from '@/utils/const';
import type { iChar, iTransformChar } from '@/types/interfaces';

function setDescription(description: string): string {
  if (description.length > MAX_LENGTH_DESCR) {
    return `${description.slice(0, MAX_LENGTH_DESCR)}...`;
  }
  if (!description) {
    return MESSAGES.EMPTY_DESCRIPTION;
  }
  return description;
}

function setComics(comics: string[]): string[] {
  if (comics.length > 10) comics.splice(0, 10);
  if (!comics.length) comics.push(MESSAGES.EMPTY_COMICS);
  return comics;
}

export default function transformChars(char: iChar): iTransformChar {
  const {
    name,
    thumbnail: thumb,
    id,
    description,
    urls,
    comics: comicsList,
  } = char;
  const thumbnail = `${thumb.path}.${thumb.extension}`;
  const comics: string[] = comicsList.items.map((item) => item.name);
  return {
    id,
    description: setDescription(description),
    name,
    thumbnail,
    links: [
      {
        label: urls[0].type,
        url: urls[0].url,
        type: 'primary',
      },
      {
        label: urls[1].type,
        url: urls[1].url,
        type: 'secondary',
      },
    ],
    comics: setComics(comics),
  };
}
