using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Threading.Tasks;

namespace JsonExtraction
{
    class Program
    {
        public const string BaseUrl = "https://swapi.co/api/films?search=";

        static void Main(string[] args)
        {
            if (args == null || args.Length < 3)
            {
                Console.WriteLine("Please provide 3 input to continue...");
            }
            else
            {
                string arguement = args[0];
                FilmParams movie = new FilmParams()
                {
                    Title = args[0],
                    CollectionName = args[1],
                    FinalProperty = args[2]
                };
                ProcessInput(movie);
            }
            Console.Read();
        }

        public static void ProcessInput(FilmParams movie)
        {
            string url = BaseUrl + movie.Title;
            string result = processUrl(url);
            JObject o = JObject.Parse(result);
            var hashSet = new HashSet<object>();
            if (o["results"] is JArray)
            {
                var collections = ((JArray)o["results"]).First().Children<JProperty>().FirstOrDefault(p => p.Name == movie.CollectionName);
                if (collections.Value != null)
                {

                    Parallel.ForEach(collections.Value, jtoken =>{
                          var final = processUrl(jtoken.ToString());
                        JObject finalProperty = JObject.Parse(final);
                        JToken foundProperty = finalProperty[movie.FinalProperty];
                        if (foundProperty != null)
                        {
                            JValue JValueFinalProp = finalProperty[movie.FinalProperty] as JValue;
                            if (!hashSet.Contains(JValueFinalProp.Value))
                            {
                                hashSet.Add(JValueFinalProp.Value);
                                Console.WriteLine(JValueFinalProp.Value);
                            }
                        }                     
                    });                    
                }
            }
        }

        private static string processUrl(string url)
        {
            string result = string.Empty;
            HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(url);
            HttpWebResponse httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();

            StreamReader reader = new StreamReader(httpWebResponse.GetResponseStream());
            result = reader.ReadToEnd();
            return result;
        }
    }
}
