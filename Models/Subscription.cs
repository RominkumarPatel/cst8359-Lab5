namespace Lab5.Models
{
    public class Subscription
    {
        public int FanId { get; set; }
        public string SportClubId { get; set; }

        public Fan Fan { get; set; } // Navigational property
        public SportClub SportClub { get; set; } // Navigational property
    }
}
