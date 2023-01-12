export interface UrlBookmark {
  urlBookmark: string;
}

export interface FilePickerPlugin {
  chooseDirectory(): Promise<UrlBookmark>;
  accessDirectory(options: UrlBookmark): Promise<{url: string}>;
  releaseDirectory(options: UrlBookmark): Promise<void>;
}