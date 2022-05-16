<template>
  <div>
    <section class="wrapper bg-yellow">
      <div class="container pt-8 pt-md-8 pb-4">
        <div class="row">
          <div class="col-md-8 offset-md-2 col-lg-6 offset-lg-1 position-relative order-2">
            <p class="small-caps font-weight-bold mb-0"><b>Total PILE distributed <span v-if="numUsers>0">to {{numUsers}} participants</span></b></p>
            <p class="display-2 focus-outline mb-0">{{ totalSold }} / <span class="small">1 mln</span></p>
            <progress id="file" max="100" :value="progress"> {{ this.progress }}% </progress>
            <p class="small-caps font-weight-bold mb-0" v-if="showCountdown()"><b>Remaining time</b></p>
            <p class="small-caps font-weight-bold mb-0" v-if="!showCountdown()"><b>Starting on:</b></p>
            <p class="display-4" v-if="!showCountdown()">{{prettifyDate(startTime)}}</p>
            <div class="d-flex justify-content-between mb-3 time-wrapper" v-if="showCountdown()">
              <div class="time-cell d-flex flex-column">
                <div class="text-center">{{rDate.rDays}}</div>
                <div class="text-uppercase small">days</div>
              </div>
              <div class="time-cell d-flex flex-column">
                <div class="text-center">{{rDate.rHours}}</div>
                <div class="text-uppercase small">hours</div>
              </div>
              <div class="time-cell d-flex flex-column">
                <div class="text-center">{{rDate.rMinutes}}</div>
                <div class="text-uppercase small">min</div>
              </div>
              <div class="time-cell d-flex flex-column">
                <div class="text-center">{{rDate.rSeconds}}</div>
                <div class="text-uppercase small">sec</div>
              </div>
            </div>
            <p class="small-caps font-weight-bold mb-0"><b>Current bonus</b></p>
            <p class="display-2 focus-outline">+{{ floatProcent }}%</p>
            <p class="small-caps font-weight-bold mb-0"><b>Minimum amount:</b> <span class="small">1000 EVER</span></p>
            <p class="small-caps font-weight-bold mb-0"><b>Campaign starts:</b> <span class="small">{{ prettifyDate(startTime)}}</span></p>
            <p class="small-caps font-weight-bold mb-0"><b>Campaign completes:</b> <span class="small">{{ prettifyDate(endTime) }}</span></p>
            <p class="small-caps font-weight-bold mb-0"><b>Vesting cliff:</b> <span class="small">4 months</span></p>
          </div>
          <!--/column -->
          <div class="col-lg-5 order-1">
            <h1 class="display-1 mb-5">Become a part of our DAO</h1>
            <p class="lead fs-25 lh-sm mb-7 px-md-10 px-lg-0">PileBlocks is an Everscale multiplayer P2E dApp which allows players to complete images from tiles together and earn tokens.</p>
            <div class="d-flex justify-content-center justify-content-lg-start mb-4">
              <span><a href="#about-us" class="btn btn-sm btn-primary rounded-pill me-2">Read More</a></span>
              <span><a href="#get-dao-tokens" class="btn btn-sm btn-primary rounded-pill me-2">Receive DAO Tokens</a></span>
            </div>
            <p class="small-caps font-weight-bold mb-4"><b>Contract address:</b> <span class="small"><a href="https://everscan.io/accounts/0:8e670a27b88b51d6c33470958349ff70c6aa143f56d5a95b674db1e1557d9e0d" target="_blank"><u>link</u></a>, code</span></p>
          </div>
          <!--/column -->
        </div>
        <!-- /.row -->
      </div>
    </section>
    <section class="wrapper bg-light">
      <div id="about-us" class="href-div"></div>
      <div class="container mt-14">
        <h2 class="display-4">Briefly About Us</h2>
        <p>PileBlocks' birthday is Jan 12, 2022.</p>
        <p>Since then, we're proud to share the following prominent achievements:</p>
        <ul>
          <li><a href="http://pileblocks.github.io/"><u>MVP</u></a> is <b>ready</b> (just after 3 months since WP!) and is <b>100% on chain</b>, true WEB 3.0, huh</li>
          <li>Our code is <b>reviewed</b> by a reputable community nerd <a href="https://t.me/mnill" target="_blank"><u>@mnill</u></a></li>
          <li>Our great and highly-motivated <a href="https://t.me/pileblocks_group"><u>community</u></a> counts <b>50 members</b> and growing</li>
          <li>Our <a href="https://everscan.io/accounts/0:dbba0028173f5b8d09eb597e0cca88cb41a4875efdf8a1815bb31292f150f800" target="_blank"><u>token</u></a> has more than <b>50 holders</b></li>
          <li>We successfully completed <b>5 games</b> and rolling</li>
          <li>Around <b>50%</b> of our players are returning users (see the stats)</li>
          <li>Together we collected more than <b>10K EVERs</b> into the <a href="https://app.flatqube.io/pairs/0:6eca23d8eaebd567261e16fd4acd5240870a65c819a272a2f7e330fc79854b1e" target="_blank"><u>WEVER & PILE pool</u></a> to provide liquidity </li>
          <li>An average account receivables per game is <b>600 EVERs</b> </li>
          <li>Our token is <b>whitelisted</b> by a Broxus grant receiver, the project <a href="https://everspace.app/" target="_blank"><u>Everspace</u></a></li>
          <li>Great integrations with <b>GrandBazar</b> and <b>SOON</b> are in the pipe and cooking</li>
        </ul>
        <p>Please check the game image examples below.</p>
        <div class="d-flex light-gallery-wrapper justify-content-evenly">
          <figure class="overlay hover-scale rounded">
            <a href="./assets/img/ever_tile.png" class="lightbox">
              <img srcset="/assets/img/ever_tile.png" class="avatar w-15" alt="" />
            </a>
          </figure>
          <figure class="overlay hover-scale rounded">
            <a href="./assets/img/grehamster_tile.png" class="lightbox">
              <img src="/assets/img/grehamster_tile.png" class="avatar w-15" alt="" />
            </a>
          </figure>
          <figure class="overlay hover-scale rounded">
            <a href="./assets/img/dusa_tile.png" class="lightbox">
              <img src="/assets/img/dusa_tile.png" class="avatar w-15" alt="" />
            </a>
          </figure>
        </div>
      </div>
      <!-- /.container -->
    </section>
    <!-- /section -->
    <section class="wrapper bg-light">
      <div id="our-strategy" class="href-div"></div>
      <div class="container mt-14">
        <h2 class="display-4">Our Strategy</h2>
        <p>Our ambitious strategy targets for 2022 are:</p>
        <ul>
          <li>Build up on Solana NFTs and deeply integrate them into the game mechanics to <b>expose additional value</b> and lure Solana audience into PileBlocks (which would also raise the bar for possible rewards)</li>
          <li>Actively communicate with Solana artists to <b>get more integrations</b> and push for the in-flow of Solana users</li>
          <li>Provide a <b>smooth and easy-to-follow customer journey</b> to channel-up acquisition & activation of Solana users</li>
          <li>Set up a <b>distinctive visual brand</b> and <b>social-media presence</b> to differentiate from competitors and provide the necessary guidance to newcomers and veterans</li>
        </ul>
        <p>These targets are <i>marketing targets</i>, thus they do not require any significant development. The thing they definitely require is <b>experiments</b>, split tests, and visuals to efficiently convey our customer messages.</p>
        <blockquote class="fs-lg">
          <p>If you wish to become a part of this endeavour, we're happy to share our DAO tokens (PILE) with you! The tokens are equally used in tokenomics and allow to govern the way we evolve and prosper. At the time of writing, PILE costs <b>only $0.04</b>, and who knows if we can push it together to the new highs as a team. </p>
        </blockquote>
      </div>
      <!-- /.container -->
    </section>
    <!-- /section -->
    <!-- /section -->
    <section class="wrapper bg-white">
      <div id="our-stats" class="href-div"></div>
      <div class="container mt-14">
        <h2 class="display-4">Our Stats</h2>
        <p>To achieve our challenging targets, we have a strong-performing product. I've drafted some awesome statistics from our previous games to demonstrate its power.</p>
        <p>This chart shows the total number of players (in violet) compared to the returning players (in yellow) for each of the games 1-4.</p>
        <img src="/assets/img/total_existing_players.png" alt="" class="img-fluid" />
        <p class="mb-8">Notice that <b>almost 50%(!)</b> of players are returning players which demonstrates that players are willing to continue playing and that the game mechanics works.</p>
        <p>The next chart shows the number of turns players actually did (in yellow) compared to the minimum number of required turns to complete a game (in violet) for each of the games 1-4.</p>
        <img src="/assets/img/num_turns_min_turns.png" alt="" class="img-fluid" />
        <p class="mb-8">The numbers demonstrate <b>+40%</b> to <b>+100%(!)</b> engagement compared to the activity which is <i>formally necessary</i> to put all tiles on the board (for example, the minimum number of turns to complete a 2048-tile game is 41 turn which is 50 * 41 = 2050 tiles since a player can put 50 tiles per turn).</p>
        <p>The last chart shows the amount in PILE players received (in violet) compared to the amount of PILE players spent in each of the games 1-4.</p>
        <img src="/assets/img/sent_vs_rewards.png" alt="" class="img-fluid" />
        <p>As you can see, the gross profit in PILE <b>becomes positive</b> if a game reward is 2500-3000 PILE (I give a range here since player motivation would be diminished a bit by reducing the reward amount from 5000 to 3000 PILE).</p>
      </div>
      <!-- /.container -->
    </section>
    <!-- /section -->
    <section class="wrapper bg-white">
      <div id="tokens-emission" class="href-div"></div>
      <div class="container mt-14">
        <h2 class="display-4">New Emission</h2>
        <p>According to <a href="https://everscan.io/accounts/0:dbba0028173f5b8d09eb597e0cca88cb41a4875efdf8a1815bb31292f150f800" target="_blank"><u>this</u></a> information, the current PILE emission is 250 000 PILE. To complete our strategic targets, I want to add <b>+1 750 000 PILE</b> to raise the total emission to 2 mln PILE. Note, that <b>no extra PILE will be minted after this emission</b> unless in consensus with DAO holders. Thus, this is the only opportunity to benefit from Solana integration for prospects who wish to obtain substantial PILE shares without slippage. The tokens will be provided with the 4-month cliff to avoid instant market speculations and give preference to the early DAO holders.</p>
        <p>Let's review the current and the proposed PILE distributions.</p>
        <img src="/assets/img/current_tokens_distribution.png" alt="" class="img-fluid" />
        <p class="mb-8">Currently, users and exchanges hold more than 65% of PILE. The remaining tokens are locked in smart contracts and are to be distributed between players as the rewards users receive after each game.</p>
        <p>The new distribution after the emission looks as follows.</p>
        <img src="/assets/img/new_emission.png" alt="" class="img-fluid mb-4" />
        <ul>
          <li>Team gets 250K PILE to actively participate in DAO and use them for partnerships and integrations</li>
          <li>Users receive 1 mln PILE to reinforce the DAO</li>
          <li>250K PILE will be added to FlatQube to the PILE + WEVER pool to ensure the liquidity</li>
          <li>250K PILE will be put to farming to attract more liquidity and distribute more DAO tokens</li>
        </ul>
      </div>
      <!-- /.container -->
    </section>
    <!-- /section -->
    <section class="wrapper bg-white">
      <div id="get-dao-tokens" class="href-div"></div>
      <div class="container mt-14">
        <h2 class="display-4">Get DAO Tokens</h2>
        <p>To obtain DAO tokens (PILE), send your EVERs to our smart contract address given below (<b>1 EVER = 5 PILE</b>). In return, you will be added to our ledger as a PILE holder and will be able to <b>claim your tokens in 4 months</b> using this website and EVER Wallet. Please do not send TIP 3.1 tokens, they won't be returned.</p>

        <p>Send EVERs to this contract address:</p>
        <p><span id="claim-address" class="me-2 small" style="overflow-wrap: break-word">{{ accountAddress }}</span>
          <button class="btn btn-outline-secondary btn-sm ps-1 pe-1 pt-0 pb-0 copy-btn" data-clipboard-target="#claim-address"><i class="uil uil-copy-alt"></i></button>
        </p>
        <p>
          <span class="small-caps">Current bonus:</span> +{{ floatProcent }}%<br />
          <span class="small-caps">DAO tokens remaining:</span> {{ this.totalReady }} PILE<br />
          <span class="small-caps">Minimum amount:</span> 1000 EVER<br />
        </p>
        <p>Please note that you can get up to <b>+25% bonus</b> PILE tokens if you participate early enough. The following list shows the bonus value depending on the campaign day when you send your EVERs.</p>
        <ul>
          <li>Day 1: +25%</li>
          <li>Day 2: +15%</li>
          <li>Day 3: +10%</li>
          <li>Day 4: +5%</li>
          <li>Day 5: NO BONUS</li>
        </ul>
        <h3>Check DAO tokens</h3>
        <p>Enter your wallet address to check how many tokens you will receive after the cliff is over.</p>
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Your wallet, for example, 0:723...eda" aria-label="Recipient's username" aria-describedby="button-check-claim" v-model="claimAddress">
          <button class="btn btn-primary" type="button" id="button-check-claim" v-on:click="checkClaim(claimAddress)">
            <i class="uil uil-search-alt" v-if="!isLoadingCheck"></i>
            <div class="spinner-grow spinner-grow-sm" role="status" v-if="isLoadingCheck">
            </div>
          </button>
        </div>
        <p class="alert alert-primary" v-show="claimMessage.length > 0">{{ claimMessage }}</p>
        <h3>Will there be a soft cap?</h3>
        <p>There is no soft cap for the campaign, thus depending on the number of tokens distributed, the team's, farming and liquidity tokens will be minted and distributed proportionally.</p>
        <p>If you have any questions, please write to our <a href="https://t.me/pileblocks_group"><u>Telegram group</u></a> or contact me by email.</p>
      </div>
      <!-- /.container -->
    </section>
  </div>
</template>

<script>
import {signerNone, TonClient} from '@eversdk/core';
import { libWeb } from '@eversdk/lib-web';
import { Account } from "@eversdk/appkit";
import {PileBlocksDAOContract} from "@/contract_wrappers/PileBlocksDAOContract";
import dateFormat from 'dateformat';
import BigNumber from "bignumber.js";

export default {
  name: 'App',
  data: function () {
      return {
          counter: 1,
          account: null,
          claimAddress: "",
          accountAddress: "0:8e670a27b88b51d6c33470958349ff70c6aa143f56d5a95b674db1e1557d9e0d",
          isLoadingCheck: false,
          rDate: { rDays: 0, rHours: 0, rMinutes: 0, rSeconds: 0 },
          startTime: 0,
          endTime: 0,
          claimTime: 0,
          progress: 0,
          totalSold: 0,
          totalReady: 0,
          floatProcent: 0,
          claimMessage: '',
          numUsers: 0
      }
  },
  components: {
  },
  async mounted() {
    BigNumber.config({
        FORMAT: {
            groupSize: 3,
            groupSeparator: ' ',
            decimalSeparator: '.'
        },
    });
    TonClient.useBinaryLibrary(libWeb);
    const client = new TonClient({
      network: {
        //endpoints: ["http://localhost"]
        //endpoints: ["eri01.net.everos.dev", "rbx01.net.everos.dev", "gra01.net.everos.dev"]
        endpoints: ["eri01.main.everos.dev", "gra01.main.everos.dev", "gra02.main.everos.dev"]
      }
    });

    this.account = new Account(PileBlocksDAOContract, {
      address: this.accountAddress,
      client,
      signer: signerNone(),
    });

    await this.getNumberOfUsers();
    await this.getDetails();

    setInterval(this.calculateRemainingDate, 1000);

    this.account.subscribeAccount("balance", (acc) => {
        this.getDetails();
        this.getNumberOfUsers();
    });
  },
  methods: {
    getDetails: async function () {
      let result = await this.account.runLocal("getDetails", {});
      result = result.decoded.output.data;
      this.startTime = parseInt(result.startTime);
      this.endTime = parseInt(result.endTime);
      this.totalReady = new BigNumber(parseInt(result.totalReady)).dividedBy(1e9).toFormat(0);
      this.progress = parseInt(result.totalSold) * 100 / parseInt(result.totalReady);
      this.totalSold = new BigNumber(parseInt(result.totalSold)).dividedBy(1e9).toFormat(0);
      this.floatProcent = parseInt(result.floatProcent);
      this.claimTime = parseInt(result.claimTime);
    },
    getNumberOfUsers: async function () {
      let result = await this.account.runLocal("mUsers", {});
      this.numUsers = Object.keys(result.decoded.output.mUsers).length;
    },
    calculateRemainingDate() {
        let now = Math.floor(Date.now() / 1000);
        if (this.startTime === 0 || now > this.endTime) {
            this.rDate.rDays = 0;
            this.rDate.rHours = 0;
            this.rDate.rMinutes = 0;
            this.rDate.rSeconds = 0;
            return;
        }
        let endDate = this.startTime;
        if (now > this.startTime) {
            endDate = this.endTime;
        }
        this.rDate.rDays = Math.floor((endDate - now) / (60 * 60 * 24));
        this.rDate.rHours = Math.floor(((endDate - now - this.rDate.rDays * 60 * 60 * 24) / (60 * 60)));
        this.rDate.rMinutes = Math.floor((endDate - now - this.rDate.rDays * 60 * 60 * 24 - this.rDate.rHours * 60 * 60) / 60);
        this.rDate.rSeconds = Math.floor(endDate - now - this.rDate.rDays * 60 * 60 * 24 - this.rDate.rHours * 60 * 60 - this.rDate.rMinutes * 60);
    },
    prettifyDate: function (timestamp) {
      return dateFormat(new Date(timestamp * 1000), "dd-mmm-yyyy hh:MM:ss");
    },
    checkClaim: async function() {
      let result = await this.account.runLocal("getTokensOfUser", {"userAddress": this.claimAddress});
      let tokens = new BigNumber(parseInt(result.decoded.output.userTokens)).dividedBy(1e9).toFormat(0);
      let cliffEnd = this.prettifyDate(this.claimTime);
      this.claimMessage = `This wallet currently has ${tokens} PILE tokens. Please claim them after ${cliffEnd}.`;
      console.log();
    },
    showCountdown: function() {
      return Date.now() > this.startTime * 1000;
    }

  }
}
</script>

<style>
</style>
