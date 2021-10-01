using System;
using System.IO;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        static async Task Main()
        {
            var s = await Vocovo.Fire("0001");
            Console.WriteLine(s);
        }
    }
}
