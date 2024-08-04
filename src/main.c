/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: niperez <niperez@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/07/31 11:14:07 by niperez           #+#    #+#             */
/*   Updated: 2024/08/02 16:45:21 by niperez          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fractol.h"

int	main(int argc, char **argv)
{
	t_fractal	fractal;

	if (!(argc == 2 && !ft_strncmp(argv[1], "mandelbrot", 10))
		&& !(argc == 4 && !ft_strncmp(argv[1], "julia", 5)))
		return (ft_putstr_fd(ERROR_MESSAGE, 2), 1);
	init_fractal(argv, &fractal);
	fractal_render(&fractal);
	mlx_loop(fractal.mlx);
	close_handler(&fractal);
	return (0);
}
