# Inception
Inception is a 42 project focused on learning Docker and Docker Compose. The objective is to create a small network of three Docker containers: one for Nginx, one for WordPress, and one for MariaDB. These containers must interact over the Docker network to serve a local website.

## Preamble
<img width="582" alt="Screenshot 2024-09-20 at 4 38 15 AM" src="https://github.com/user-attachments/assets/b475c87e-68a1-43f5-bbd7-156a38b92f30">

## Project Structure
The project is structured as follows:

- `srcs/`: Contains the Docker configurations and project files.
  -  `nginx/`: Configuration files for the Nginx container.
  -  `wordpress/`: Files related to the WordPress installation.
  -  `mariadb/`: MariaDB configuration and initialization files.
  -  `.env`: Environment variables file.

## How to run?
To launch this project, follow these steps:

1. Clone this repository and navigate into it:

```
git clone <repository_url>
cd <repository_directory>
```

2. In the srcs folder, fill out the ExampleEnvFile and save it as srcs/.env.

3. Edit the login variable in the Makefile to reflect your 42 school login.

4. Build and launch the Docker containers using make:

```make```

5. The website should be accessible at `https://localhost` or `http://<your_login>.42.fr` (replace `<your_login>` with the value in the Makefile).
