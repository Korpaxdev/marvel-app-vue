export const API = 'https://gateway.marvel.com:443/v1/public/';
export const KEY = 'apikey=8178973bd823e4f1b41eeec85f1b9a50';
export const STATUS = {
  LOADING: 'loading',
  ERROR: 'error',
  DONE: 'done',
};
export const MESSAGES = {
  EMPTY_DESCRIPTION: 'This character does not have a description',
  STATUS_ERROR: 'Unexpected error. Please try again later',
  EMPTY_COMICS: `This character doesn't have comics`,
};
export const BUTTON_LABEL = {
  LOADING: 'Loading...',
  END: 'List ended',
  TRY: 'Try it',
  LOAD: 'Load more',
};

export const OFFSET = 0;
export const CHARS_LIMIT = 6;
export const MAX_LENGTH_DESCR = 150;
