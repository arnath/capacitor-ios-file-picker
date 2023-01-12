import { WebPlugin } from '@capacitor/core';

import type { FilePickerPlugin, SecureUrl, UrlBookmark } from './definitions';

export class FilePickerWeb extends WebPlugin implements FilePickerPlugin {
  async chooseDirectory(): Promise<UrlBookmark> {
    throw 'Not supported for web';
  }

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  async accessDirectory(_options: UrlBookmark): Promise<SecureUrl> {
    throw 'Not supported for web';
  }

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  async releaseDirectory(_options: UrlBookmark): Promise<void> {
    throw 'Not supported for web';
  }
}
