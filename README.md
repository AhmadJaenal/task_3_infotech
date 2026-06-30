## State Management

Aplikasi ini menggunakan **Provider** sebagai state management karena sederhana dan sudah cukup untuk kebutuhan aplikasi Todo List yang memiliki state berupa daftar task dan filter.

Implementasi Provider dilakukan melalui `TaskProvider` yang bertugas mengelola seluruh data aplikasi, seperti:

- Menambahkan task (`addTask`)
- Mengubah status task (`toggleStatus`)
- Menghapus task (`deleteTask`)
- Mengubah filter (`changeFilter`)
- Menyediakan statistik task dan daftar task yang telah difilter

Setiap perubahan data akan memanggil `notifyListeners()`, sehingga widget yang menggunakan `Consumer<TaskProvider>` akan otomatis diperbarui tanpa perlu melakukan refresh secara manual. Dengan pendekatan ini, logika bisnis tetap terpisah dari tampilan (UI), sehingga kode menjadi lebih rapi, mudah dipelihara, dan mudah dikembangkan.# task_3_infotech
