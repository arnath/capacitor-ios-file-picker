export interface UrlBookmark {
  urlBookmark?: string;
}

export interface SecureUrl {
  url?: string;
}

export interface FilePickerPlugin {
  chooseDirectory(): Promise<UrlBookmark>;
  accessDirectory(options: UrlBookmark): Promise<SecureUrl>;
  releaseDirectory(options: UrlBookmark): Promise<void>;
}