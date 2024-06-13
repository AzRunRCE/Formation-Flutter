namespace TweetMicroApi.Models
{
    public class Tweet
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Content { get; set; }
        public DateTime? Timestamp { get; set; }
        public int Likes { get; set; }
        public int Retweets { get; set; }
    }
}
