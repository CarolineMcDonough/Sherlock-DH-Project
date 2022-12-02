const request = window.indexedDB.open("StoriesDB", 1);
request.onerror = (event) => {
    console.error(`Database error: ${event.target.errorCode}`);
  };
  request.onupgradeneeded = (event) => {
    const db = event.target.result;

    // create the Contacts object store 
    // with auto-increment id
     let store = db.createObjectStore('stories', {
        autoIncrement: true
    });
  
    let index = store.createIndex('storyName', 'emailemailemailemailemail', {
        unique: true
    });
  
    // Use transaction oncomplete to make sure the objectStore creation is
    // finished before adding data into it.
    objectStore.transaction.oncomplete = (event) => {
      // Store values in the newly created objectStore.
      const customerObjectStore = db.transaction("customers", "readwrite").objectStore("customers");
      customerData.forEach((customer) => {
        customerObjectStore.add(customer);
      });
    }
}