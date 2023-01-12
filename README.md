# capacitor-ios-file-picker

Allows picking one or more files/directories on iOS, including files from outside your app's sandbox. Under the covers, we use the iOS UIDocumentPickerViewController and security-scoped URLs to accomplish this.

## Install

```bash
npm install capacitor-ios-file-picker
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------

</docgen-api>
