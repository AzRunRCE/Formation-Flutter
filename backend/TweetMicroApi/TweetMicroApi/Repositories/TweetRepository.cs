using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Xml;
using TweetMicroApi.Models;

namespace TweetMicroApi.Repositories
{



    public class TweetRepository 
    {
        private readonly string _filePath = @"db\tweets.json";

        public async Task<IEnumerable<Tweet>> GetAllAsync()
        {
            if (!File.Exists(_filePath))
            {
                return new List<Tweet>();
            }

            var json = await File.ReadAllTextAsync(_filePath);
            return JsonConvert.DeserializeObject<List<Tweet>>(json).OrderByDescending(t => t.Id);
        }

        public async Task<Tweet> GetByIdAsync(int id)
        {
            var tweets = await GetAllAsync();
            return tweets.FirstOrDefault(t => t.Id == id);
        }

        public async Task AddAsync(Tweet tweet, string user)
        {
            tweet.Username = user;
            var tweets = (await GetAllAsync()).ToList();
            tweet.Id = tweets.Any() ? tweets.Max(t => t.Id) + 1 : 1;
            tweets.Add(tweet);
            await SaveAllAsync(tweets);
        }

        public async Task UpdateAsync(Tweet tweet)
        {
            var tweets = (await GetAllAsync()).ToList();
            var existingTweet = tweets.FirstOrDefault(t => t.Id == tweet.Id);
            if (existingTweet != null)
            {
                existingTweet.Username = tweet.Username;
                existingTweet.Content = tweet.Content;
                existingTweet.Timestamp = tweet.Timestamp;
                existingTweet.Likes = tweet.Likes;
                existingTweet.Retweets = tweet.Retweets;
                await SaveAllAsync(tweets);
            }
        }

        public async Task DeleteAsync(int id)
        {
            var tweets = (await GetAllAsync()).ToList();
            var tweet = tweets.FirstOrDefault(t => t.Id == id);
            if (tweet != null)
            {
                tweets.Remove(tweet);
                await SaveAllAsync(tweets);
            }
        }

        private async Task SaveAllAsync(IEnumerable<Tweet> tweets)
        {
            var json = JsonConvert.SerializeObject(tweets, Newtonsoft.Json.Formatting.Indented);
            await File.WriteAllTextAsync(_filePath, json);
        }
    }

}
