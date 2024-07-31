#######################################################
## ARGUMENTS

NAME		=	fractol

CC			=	cc
CFLAGS		=	-Wall -Wextra -Werror
HEADER		=	-I/usr/include

SRC_DIR		=	src/
OBJ_DIR		=	obj/

LIB_PATH	=	./libft
LIB			=	$(LIB_PATH)/libft.a

RM			=	rm -rf

#######################################################
## SRCS & OBJS

FILES		= \
			main \
			init \
			events \
			render \
			math_utils \
			string_utils \

SRCS	=	$(addprefix $(SRC_DIR), $(addsuffix .c, $(FILES)))
OBJS	=	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(FILES)))

#######################################################
## RULES

all : $(NAME)

$(NAME) : $(OBJS)
		$(CC) $(CFLAGS) $(OBJS) -Lmlx_linux -lmlx_Linux -L/usr/lib -Imlx_linux -lXext -lX11 -lm -lz -o $(NAME)

$(OBJ_DIR)%.o : $(SRC_DIR)%.c | $(OBJ_DIR)
		$(CC) $(CFLAGS) $(HEADER) -Imlx_linux -c $< -o $@

$(OBJ_DIR):
		@mkdir -p $(OBJ_DIR)

clean :
		make -C $(LIB_PATH) fclean
		$(RM) $(OBJ_DIR)

fclean : clean
		$(RM) $(NAME)

re : fclean all

.PHONY: all clean fclean re
