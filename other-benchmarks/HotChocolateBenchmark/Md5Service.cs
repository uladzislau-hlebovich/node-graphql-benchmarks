using System.Security.Cryptography;
using System.Text;

namespace HotChocolateBenchmark;

public static class Md5Service
{
    private static readonly MD5 Hasher = MD5.Create();
    
    public static string Hash(string input)
    {
        byte[] data = Hasher.ComputeHash(Encoding.UTF8.GetBytes(input));
        StringBuilder sBuilder = new StringBuilder();
        foreach (var t in data)
        {
            sBuilder.Append(t.ToString("x2"));
        }
        return sBuilder.ToString();
    }
}