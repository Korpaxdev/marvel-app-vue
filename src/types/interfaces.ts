import type { btnClass } from '@/types/types';

export interface iChar {
  id: number;
  name: string;
  description: string;
  thumbnail: {
    path: string;
    extension: string;
  };
  urls: { type: string; url: string }[];
  comics: {
    items: { name: string }[];
  };
}

export interface iTransformChar {
  id: number;
  name: string;
  description: string;
  thumbnail: string;
  links: { label: string; url: string; type: btnClass }[];
  comics: string[];
}

export interface iRequest {
  data: {
    results: iChar[];
  };
}
