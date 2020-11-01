<p align="center">
  <img src="https://github.com/zgramming/Flutter-Combo-Laravel/blob/main/screenshot/banner_github.png" height="400">
</p>

# Combo Flutter & Laravel 

<p align="center">
   <img src="https://github.com/zgramming/Flutter-Combo-Laravel/blob/main/screenshot/gif/login_register.gif" alt="Databay showcase gif" title="Databay showcase gif" width="250"/>
   <img src="https://github.com/zgramming/Flutter-Combo-Laravel/blob/main/screenshot/gif/form_product.gif" alt="Databay showcase gif" title="Databay showcase gif" width="250"/>
    <img src="https://github.com/zgramming/Flutter-Combo-Laravel/blob/main/screenshot/gif/detail_product.gif" alt="Databay showcase gif" title="Databay showcase gif" width="250"/>
</p>

Example flutter application to consume REST API from laravel back-end

## What's in here ?

### REST API Laravel

If you are interested in this REST API and want to customize it, you can follow this <a href="https://github.com/zgramming/REST-API-COMBO-LARAVEL">link</a>. This application used REST API in that link.

### Template 

What's mean ? I make separated packages to make flutter application faster. Inside it include:

* Template **Login** and **Splash Screen**
* Reusable Widget
* Function
* Color Pallete
* App Config
* Sizes
* and many more...

If you interested with this, you can follow this <a href="https://github.com/zgramming/Global-Template" target="_blank">link</a>

### State management 
State management in this application used <a href="https://riverpod.dev/" target="_blank">Flutter Riverpod</a> . If you familiar with <a href="https://pub.dev/packages/provider" target="_blank">Provider</a> ,i think you might will like it because riverpod <a href="https://github.com/rrousselGit" target="_blank">author</a> is same and have improvement from provider.
Because this package is new and still a little tutorial on this package , i think what i write in this application not yet best practice. If you have suggestion , feel free to discussion. 

### Screen 
This application have some screen inside it  :

<table>
   <thead>
      <tr>
        <th>Splash</th>
        <th>Login</th>
        <th>Register</th>
      </tr>
  </thead>
  <tbody>
    <tr>
      <td><img src="https://github.com/zgramming/Flutter-Combo-Laravel/blob/main/screenshot/splash.jpeg" height="500" width="300"></td>
      <td><img src="https://github.com/zgramming/Flutter-Combo-Laravel/blob/main/screenshot/login.jpeg" height="500" width="300"></td>
      <td><img src="https://github.com/zgramming/Flutter-Combo-Laravel/blob/main/screenshot/register.jpeg" height="500" width="300"></td>
    </tr>
  </tbody>
</table>
  <br>
<table>
   <thead>
      <tr>
        <th>Welcome</th>
        <th>Form Product</th>
        <th>Detail Product</th>
      </tr>
  </thead>
  <tbody>
    <tr>
      <td><img src="https://github.com/zgramming/Flutter-Combo-Laravel/blob/main/screenshot/welcome.jpeg" height="500" width="300"></td>
      <td><img src="https://github.com/zgramming/Flutter-Combo-Laravel/blob/main/screenshot/form_product.jpeg" height="500" width="300"></td>
      <td><img src="https://github.com/zgramming/Flutter-Combo-Laravel/blob/main/screenshot/detail_product.jpeg" height="500" width="300"></td>
    </tr>
  </tbody>
</table>
  
* Splash 
* Login  
* Register (Modal Bottom Sheet)
* Welcome  
* Form Product (Modal Bottom Sheet)
* Detail Product 

### Feature 
Because this application have a goal how to consume REST API from laravel back-end, i include basic **CRUD(Create,Read,Update,Delete)** function : 

* Login (Login using email and password)
* Register (Required name, email, password, password confirmation. Then if register success, user will get email based on email user entered)
* Save user information to Shared Preferences
* Update user image profile [From camera/gallery]
* Add, Update [Only image / another field], delete product
* Show detail product
* Show dialog loading while request to server (It's nice to prevent user to action while request to server)

## Issues

Please file any issues, bugs or feature request as an issue on <a href="https://github.com/zgramming/Peduli-Tugas/issues"><b> Github </b></a>

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
