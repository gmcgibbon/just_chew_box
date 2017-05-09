# Just Chew Box

Just Chew Box is the vagrant base box used for developing [Just Chew](https://github.com/winnipegrb/just_chew).

## Provisioning

In order to build this box, do the following:

  1. Install the berkshelf plugin:

  ```sh
  vagrant plugin install vagrant-berkshelf
  ```

  2. Install the omnibus plugin:

  ```sh
  vagrant plugin install vagrant-omnibus
  ```

  3. Setup the box:

  ```sh
  vagrant up
  ```

## License

This project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
