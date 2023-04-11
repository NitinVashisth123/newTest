import { LightningElement, track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

export default class FileUploader extends LightningElement {
    acceptedFormats = ['.pdf', '.jpg', '.png'];

    handleUploadFinished(event) {
        const files = event.detail.files;
        let index = 0;
        const batchSize = 200;

        processFiles();

        function processFiles() {
            const batch = files.slice(index, index + batchSize);
            if (batch.length === 0) {
                return;
            }

            const promises = batch.map(file => {
                const contentVersion = {
                    'PathOnClient': file.name,
                    'VersionData': file.base64
                };

                return createRecord({ apiName: 'ContentVersion', fields: contentVersion });
            });

            Promise.all(promises)
                .then(() => {
                    index += batchSize;
                    processFiles();
                })
                .catch(error => { console.error('Error uploading file: ', error); });
        }
    }
}