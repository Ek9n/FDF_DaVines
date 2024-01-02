NAME=fdf
CFLAGS= -Wextra -Wall -Werror -I/usr/local/include
LIBFT= libft/libft.a
MLX = -L ./minilibx-linux -lmlx -lXext -lX11 -lm
CC=cc

SRCS = main.c render.c handle_events.c
OBJS	:= ${SRCS:.c=.o}

RM=rm -rf

$(NAME): $(OBJS) $(MLX) $(LIBFT)
	@$(CC) $(OBJS) $(MLX) $(LIBFT) -o $(NAME)

$(MLX) :
	$(MAKE) -C ./minilibx-linux
	chmod +777 ./minilibx-linux/configure

$(LIBFT) :
	$(MAKE) -C ./libft

all: $(NAME)

clean:
		$(MAKE) clean -C ./libft
		$(RM) $(OBJS)

fclean: clean
		$(MAKE) fclean -C ./libft
		$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re