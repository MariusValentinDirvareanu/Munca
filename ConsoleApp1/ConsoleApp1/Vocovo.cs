using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    public static class Vocovo
    {
        static readonly HttpClient client = new HttpClient();
        static readonly string ServerAddress = "http://10.168.30.129:8081/v1/notify-";
        /// <summary>
        /// Get the messages's list. The data array will return up to 100 results.
        /// </summary>
        /// <returns>void</returns>
        public static async Task<string> List()
        {
            try
            {
                HttpResponseMessage response = await client.GetAsync(ServerAddress + "list");
                response.EnsureSuccessStatusCode();
                string responseBody = await response.Content.ReadAsStringAsync();
                return responseBody;
            }
            catch (HttpRequestException e)
            {
                return e.Message;
            }
        }
        /// <summary>
        /// Play a message
        /// </summary>
        /// <param name="id">Message id</param>
        /// <returns></returns>
        public static async Task<string> Fire(string id)
        {
            try
            {
                var json = new FireModel()
                {
                    id = id
                };
                var stringContent = new StringContent(JsonSerializer.Serialize(json), Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync(ServerAddress + "fire", stringContent);
                response.EnsureSuccessStatusCode();
                string responseBody = await response.Content.ReadAsStringAsync();
                return responseBody;
            }
            catch (HttpRequestException e)
            {
                return e.Message;
            }
        }
        /// <summary>
        /// Upload a message to the Vocovo controller
        /// </summary>
        /// <param name="id"></param>
        /// <param name="conference"></param>
        /// <param name="audio">.mp3 file location</param>
        /// <param name="title"></param>
        /// <param name="repeats"></param>
        /// <param name="interval"></param>
        /// <returns></returns>
        public static async Task<string> Store(string id, int conference, string audio, string title, int repeats, int interval)
        {
            try
            {
                var json = new StoreModel()
                {
                    id = id,
                    conference = conference,
                    audio = "data:audio/mpeg;base64, " + Base64Encode(audio),
                    title = title,
                    repeats = repeats,
                    interval = interval
                };
                var stringContent = new StringContent(JsonSerializer.Serialize(json), Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync(ServerAddress + "store", stringContent);
                response.EnsureSuccessStatusCode();
                string responseBody = await response.Content.ReadAsStringAsync();
                return responseBody;
            }
            catch (HttpRequestException e)
            {
                return e.Message;
            }
        }
        /// <summary>
        /// Convert binary file .mp3 to Base64 string
        /// </summary>
        /// <param name="fileLocation">File location .mp3</param>
        /// <returns>Base64 string</returns>
        public static string Base64Encode(string fileLocation)
        {
            var file = File.OpenRead(fileLocation);
            BinaryReader binReader = new BinaryReader(file);
            binReader.BaseStream.Position = 0;
            byte[] verifyArray = binReader.ReadBytes((int)file.Length);
            return Convert.ToBase64String(verifyArray);
        }
        /// <summary>
        /// Delete a message from the Vocovo controller
        /// </summary>
        /// <param name="id">Message id</param>
        /// <returns></returns>
        public static async Task<string> Delete(string id)
        {
            try
            {
                HttpResponseMessage response = await client.DeleteAsync(ServerAddress + "delete?id=" + id);
                response.EnsureSuccessStatusCode();
                string responseBody = await response.Content.ReadAsStringAsync();
                return responseBody;
            }
            catch (HttpRequestException e)
            {
                return e.Message;
            }
        }
        /// <summary>
        /// Cancel a message by the id
        /// </summary>
        /// <param name="id">Message id</param>
        /// <returns></returns>
        public static async Task<string> Cancel(string id)
        {
            try
            {
                var json = new FireModel()
                {
                    id = id
                };
                var stringContent = new StringContent(JsonSerializer.Serialize(json), Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync(ServerAddress + "cancel", stringContent);
                response.EnsureSuccessStatusCode();
                string responseBody = await response.Content.ReadAsStringAsync();
                return responseBody;
            }
            catch (HttpRequestException e)
            {
                return e.Message;
            }
        }
    }
}
