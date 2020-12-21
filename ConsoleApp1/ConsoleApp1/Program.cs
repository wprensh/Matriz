using System;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            Int32[,] arr = MagicSquare(3);
            for (Int32 i = 0; i < arr.GetLength(0); i++)
            {
                for (Int32 j = 0; j < arr.GetLength(1); j++)
                    Console.Write($"\t{arr[i,j]}");
                Console.WriteLine("");
            }
        }

        public static Int32[,] MagicSquare(Int32 n)
        {
            if (n % 2 != 1)
                throw new Exception("N must be an odd number");

            Int32[,] result = new Int32[n,n];
            Int32 xActual = (n / 2);
            Int32 yActual = 0;
            Int32 valorActual = 1;

            while(valorActual <= n * n)
            {
                if (result[yActual,xActual] == default(Int32))
                {
                    result[yActual,xActual] = valorActual;
                    valorActual++;
                    yActual--;
                    xActual++;
                    if (yActual < 0)
                        yActual += n;
                    xActual %= n;
                }
                else
                {
                    yActual++;
                    yActual %= n;
                }
            }

            return result;
        }
    }
}
